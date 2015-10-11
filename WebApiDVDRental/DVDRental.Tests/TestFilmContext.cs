using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DatabaseClient.Repositories;
using System.Data.Entity;
using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System.Collections.Generic;
using System.Linq;
using DatabaseClient;
using Moq;
using DatabaseClient.Exentsions.Query;

namespace DVDRental.Tests
{
    [TestClass]
    public class TestFilmContext
    {
        FilmContext repository;

        [TestMethod]
        public void TestAddFilm()
        {
            var mockSet = new Mock<DbSet<Film>>();
            var mockContext = new Mock<DVDRentalContext>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            repository = new FilmContext(mockContext.Object);

            repository.AddFilm(new Models.Film { Title = "Unit test paradise", Description = "Explaining art of unit testing", Length=102 });
            mockSet.Verify(m => m.Add(It.IsAny<DatabaseClient.TableEntity.Film>()), Times.Once());
            mockContext.Verify(m => m.SaveChanges(), Times.Once());
        }

        [TestMethod]
        public void TestGetFilmById()
        {
            var filmData = new List<DatabaseClient.TableEntity.Film>
            {
                new Film { description = "Most anticipated film this year", film_id = 1, length = 47, release_year = 2015, title = "Brazzers best shots" },
                new Film { description = "Wystraczy Cię na śmierć", film_id = 2, length = 97, release_year = 2001, title = "Jumanji" },
                new Film { description = "Na faktach autentycznych", film_id = 3, length = 97, release_year = 2011, title = "Wysyp żywych trupów" }
            }.AsQueryable();

            var filmSet = new Mock<DbSet<Film>>();
            filmSet.As<IQueryable<Film>>().Setup(m => m.Provider).Returns(filmData.Provider);
            filmSet.As<IQueryable<Film>>().Setup(m => m.Expression).Returns(filmData.Expression);
            filmSet.As<IQueryable<Film>>().Setup(m => m.ElementType).Returns(filmData.ElementType);
            filmSet.As<IQueryable<Film>>().Setup(m => m.GetEnumerator()).Returns(filmData.GetEnumerator());

            var categoryData = new List<DatabaseClient.TableEntity.Category>
            {
               new Category{category_id=11,last_update=DateTime.Now, name="Horror"},
               new Category{category_id=4,last_update=DateTime.Now, name="Biography"}
            }.AsQueryable();

            var categorySet = new Mock<DbSet<Category>>();
            categorySet.As<IQueryable<Category>>().Setup(m => m.Provider).Returns(categoryData.Provider);
            categorySet.As<IQueryable<Category>>().Setup(m => m.Expression).Returns(categoryData.Expression);
            categorySet.As<IQueryable<Category>>().Setup(m => m.ElementType).Returns(categoryData.ElementType);
            categorySet.As<IQueryable<Category>>().Setup(m => m.GetEnumerator()).Returns(categoryData.GetEnumerator());

            var mockContext = new Mock<DVDRentalContext>();
            mockContext.Setup(context => context.Films).Returns(filmSet.Object);
            mockContext.Setup(context => context.Categorys).Returns(categorySet.Object);

            List<FilmToCategory> ftc = new List<FilmToCategory>()
            {
                new FilmToCategory{category_id=4,film_id=2},
                new FilmToCategory{category_id=11,film_id=2}
            };

            mockContext.Setup(context => context.FillEntity<FilmToCategory>(It.IsAny<string>()))              
                .Returns(ftc);

            repository = new FilmContext(mockContext.Object);

            var result = repository.GetFilmById(2);

            var expectedFilm = filmData.ToList()[1];

            Assert.AreEqual(expectedFilm.film_id, result.Id);
            Assert.AreEqual(expectedFilm.length, result.Length);
            Assert.AreEqual(expectedFilm.release_year, result.ReleaseYear);
            Assert.AreEqual(expectedFilm.title, result.Title);
            Assert.AreEqual(expectedFilm.description, result.Description);

            Assert.AreEqual(typeof(Models.Film), result.GetType()); // testowanie mapowania 

            Assert.AreEqual(2, result.Categories.Count());            
            Assert.AreEqual(typeof(List<Models.Category>), result.Categories.ToList().GetType()); // testowanie mapowania
        }

        [TestMethod]
        public void TestUpdateFilm()
        {
            var updateToThis = new Models.Film { Description = "this movie change your life", Length = 109, ReleaseYear = 1999, Title = "Jumanji" };

            var data = new List<DatabaseClient.TableEntity.Film>
            {
                 new Film { description = "Wystraczy Cię na śmierć", film_id = 2, length = 97, release_year = 2001, title = "Jumanji" },
            }.AsQueryable();

            var mockSet = new Mock<DbSet<Film>>();
            mockSet.As<IQueryable<Film>>().Setup(m => m.Provider).Returns(data.Provider);
            mockSet.As<IQueryable<Film>>().Setup(m => m.Expression).Returns(data.Expression);
            mockSet.As<IQueryable<Film>>().Setup(m => m.ElementType).Returns(data.ElementType);
            mockSet.As<IQueryable<Film>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());
           
            var mockContext = new Mock<DVDRentalContext>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            repository = new FilmContext(mockContext.Object);

            var updated = data.FirstOrDefault();
            repository.UpdateFilm(updateToThis);



            Assert.AreEqual(updateToThis.Description, updated.description);
            Assert.AreEqual(updateToThis.ReleaseYear, updated.release_year);
            Assert.AreEqual(updateToThis.Length, updated.length);

            mockContext.Verify(m => m.SaveChanges(), Times.Once());
        }

        [TestMethod]
        public void TestAddCategoryToFilm()
        {
            var mockSet = new Mock<DbSet<Film>>();
            var mockContext = new Mock<DVDRentalContext>();
            var mockTransaction = new Mock<ITransaction>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            mockContext.Setup(context => context.BeginTransaction()).Returns(mockTransaction.Object);
            repository = new FilmContext(mockContext.Object);

            repository.AddCategoryToFilm(3, 4);

            mockContext.Verify(context => context.ExecuteSqlCommand(false, It.IsAny<string>(), "3", "4"));
            mockContext.Verify(m => m.SaveChanges(), Times.Once());           
            mockTransaction.Verify(tran => tran.Commit(), Times.Once());
        }

        [TestMethod]
        public void TestAddFilmToCategory_SaveChangesThrowException()
        {
            var mockSet = new Mock<DbSet<Film>>();
            var mockContext = new Mock<DVDRentalContext>();
            var mockTransaction = new Mock<ITransaction>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            mockContext.Setup(context => context.BeginTransaction()).Returns(mockTransaction.Object);
            mockContext.Setup(context => context.SaveChanges()).Throws(new Exception());
            repository = new FilmContext(mockContext.Object);

            repository.AddCategoryToFilm(3, 4);

            mockContext.Verify(context => context.ExecuteSqlCommand(false, It.IsAny<string>(), "3", "4"));
            mockContext.Verify(m => m.SaveChanges(), Times.Once());
            mockTransaction.Verify(tran => tran.Rollback(), Times.Once());
        }

        [TestMethod]
        public void TestDeleteFilm()
        {
            var mockSet = new Mock<DbSet<Film>>();
            var mockContext = new Mock<DVDRentalContext>();
            var mockTransaction = new Mock<ITransaction>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            mockContext.Setup(context => context.BeginTransaction()).Returns(mockTransaction.Object);
            repository = new FilmContext(mockContext.Object);

            repository.DeleteFilm(4);

            mockSet.Verify(set => set.Find(4));
            mockSet.Verify(set => set.Remove(It.IsAny<Film>()));
            mockContext.Verify(context => context.ExecuteSqlCommand(false, "delete from film_category where film_id = {0}", "4"));
            mockContext.Verify(context => context.ExecuteSqlCommand(false, "delete from film_actor where film_id = {0}", "4"));
            mockContext.Verify(m => m.SaveChanges(), Times.Once());
            mockTransaction.Verify(tran => tran.Commit(), Times.Once());
        }

        [TestMethod]
        public void TestDeleteFilm_SaveChangesThrowException()
        {
            var mockSet = new Mock<DbSet<Film>>();
            var mockContext = new Mock<DVDRentalContext>();
            var mockTransaction = new Mock<ITransaction>();
            mockContext.Setup(context => context.Films).Returns(mockSet.Object);
            mockContext.Setup(context => context.BeginTransaction()).Returns(mockTransaction.Object);
            mockContext.Setup(context => context.SaveChanges()).Throws(new Exception());
            repository = new FilmContext(mockContext.Object);

            repository.DeleteFilm(4);

            mockSet.Verify(set => set.Find(4));
            mockSet.Verify(set => set.Remove(It.IsAny<Film>()));
            mockContext.Verify(context => context.ExecuteSqlCommand(false, "delete from film_category where film_id = {0}", "4"));
            mockContext.Verify(context => context.ExecuteSqlCommand(false, "delete from film_actor where film_id = {0}", "4"));
            mockContext.Verify(m => m.SaveChanges(), Times.Once());
            mockTransaction.Verify(tran => tran.Rollback(), Times.Once());
        }
    }
}
