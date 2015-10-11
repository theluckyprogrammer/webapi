using Contract.DatabaseContext;
using DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DVDRental.Controllers
{
    [RoutePrefix("api/film")]
    public class FilmController : ApiController
    {
        IFilmContext repository;

        public FilmController(IFilmContext repository)
            : base()
        {
            this.repository = repository;
        }

        [HttpPost]
        [Route("addcategory/{filmId}/{categoryId}")]        
        public void AddCategoryToFilm(int filmId, int categoryId)
        {
            repository.AddCategoryToFilm(filmId, categoryId);
        }

        [Route("getFilm/{id}")]
        [HttpGet]
        public Film GetFilm(int id)
        {
            return repository.GetFilmById(id);
        }

        [Route("deleteFilm/{id}")]
        [HttpDelete]
        public void DeleteFilm(int id)
        {           
             repository.DeleteFilm(id);
        }

        [Route("updateFilm")]
        [HttpPut]
        public void UpdateFilm(Film film)
        {
            repository.UpdateFilm(film);
        }

        /* przykładowy JSON
         * {
            "Title": "Alice Fantasia",
            "Description": "No one expects such a heartbreaking ending",
             "Length": 101,
             "ReleaseYear": 2015
          }
         */

        [Route("addFilm")]
        [HttpPost]
        public void AddFilm(Film film)
        {
           repository.AddFilm(film);
        }

        /*   przykładowy JSON
         * {
             
             "Description": "A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia",
             "Title": "Alice Fantasia 67",
             "Length": 2941,
             "ReleaseYear": 2006
          }
         */

    }
}
