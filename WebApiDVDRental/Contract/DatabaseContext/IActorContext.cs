
using DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Contract.DatabaseContext
{
    public interface IActorContext : IDisposable
    {
        Actor GetActorById(int id);
        void AddActor(Actor actor);
        void UpdateActor(Actor actor, int actorId);
        void DeleteActor(int ActorId);
        void AddActorToFilm(int actorId, int filmId);
    }
}