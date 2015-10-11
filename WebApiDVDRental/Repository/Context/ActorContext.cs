using Model = DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DatabaseClient.Exentsions.Query;
using DatabaseClient.Exentsions.Mappers;
using Table = DatabaseClient.TableEntity;
using Contract.DatabaseContext;

namespace DatabaseClient.Repositories
{
    public  class ActorContext : Context, IActorContext
    {
       public Model.Actor GetActorById(int id)
        {
            var actor = context.GetActorById(id);
            var mostPlayedCategory = context.GetMostPlayedActorCategory(id);
            var threeLongestFilms = context.GetThreeLongestFilmsByActor(id);
            var domainActor = actor.Map(mostPlayedCategory,threeLongestFilms,context.GetFilmCountForActor(id));            
            return domainActor;
        }


       public void AddActor(Model.Actor actor)
       {
           context.Actors.Add(new Table.Actor
               {
                   first_name = actor.FirstName,
                   last_name = actor.LastName
               });
           context.SaveChanges();
       }

       public void UpdateActor(Model.Actor actor, int actorId)
       {
           var dbActor = context.Actors.Find(actorId);
           dbActor.last_name = actor.LastName;
           dbActor.first_name = actor.FirstName;

           context.SaveChanges();
       }

       public void DeleteActor(int ActorId)
       {
           using (var transaction = context.Database.BeginTransaction())
           {
               try
               {
                   context.Database.
                   ExecuteSqlCommand(System.Data.Entity.TransactionalBehavior.DoNotEnsureTransaction, "delete from film_actor where actor_id = {0}",ActorId.ToString());
                    context.Database.
                   ExecuteSqlCommand(System.Data.Entity.TransactionalBehavior.DoNotEnsureTransaction, "delete from actor where actor_id = {0}", ActorId.ToString());
                    context.Actors.Remove(context.Actors.Find(ActorId));
                   context.SaveChanges();
                   transaction.Commit();
               }
               catch
               {
                   transaction.Rollback();
               }              
           }
       }

       public void AddActorToFilm(int actorId, int filmId)
       {
            using (var transaction = context.Database.BeginTransaction())
            {
                try
                {
                    context.Database.
                    ExecuteSqlCommand(System.Data.Entity.TransactionalBehavior.DoNotEnsureTransaction, "insert into film_actor(actor_id, film_id) VALUES ({0},{1})", filmId.ToString(), actorId.ToString());
                  
                    context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                }
            }
        }
    }
}
