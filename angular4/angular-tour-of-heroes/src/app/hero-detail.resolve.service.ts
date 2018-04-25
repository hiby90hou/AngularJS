import { Injectable } from '@angular/core';
import {
  Router, Resolve,
  ActivatedRouteSnapshot
} from '@angular/router';
import { Hero } from './hero';
import { HeroService } from './hero.service';
import 'rxjs/add/operator/toPromise';



@Injectable()
export class HeroDetailResolve implements Resolve<any> {

  constructor(
    private heroService: HeroService, 
    private router: Router
  ) { }
  resolve(route: ActivatedRouteSnapshot): Promise<any> | boolean {
    let id = +route.params['id'];
    return this.heroService.getHero(id).toPromise().
    then(hero => {
      console.log("HeroDetailResolve");
      return new Promise((resolve, reject) => {
        setTimeout(function () {
          if (hero) {
            // console.log("5s")
            console.log(hero);
            resolve(hero);
          } else { // id not found
            this.router.navigate(['/dashboard']);
            reject();
          }
          
        }, 3000);
      })      
    });
  }
}
