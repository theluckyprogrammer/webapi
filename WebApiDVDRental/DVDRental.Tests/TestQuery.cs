using DatabaseClient.Repositories;
using DatabaseClient.TableEntity;
using DVDRental.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DVDRental.Tests
{
    
    [TestClass]
    public class TestQuery
    {
        FilmContext repository;

        [TestMethod]
        public void TestGetFilmToActor()
       {          
            var mockContext = new Mock<DVDRentalContext>();
            mockContext.Setup(context => context.FillEntity<FilmToActor>(It.IsAny<string>()))
                .Returns(new List<FilmToActor>());
            DatabaseClient.Exentsions.Query.FilmToActorQuery.GetFilmToActor(mockContext.Object, 1);

            mockContext.Verify(m => m.FillEntity<FilmToActor>(It.IsAny<string>()), Times.Once);
        }
    }
}
