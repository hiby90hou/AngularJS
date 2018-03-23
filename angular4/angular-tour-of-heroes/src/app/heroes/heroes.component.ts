import { Component, OnInit } from '@angular/core';
import {Hero} from '../hero';
// import { HEROES } from '../mock-heroes';
import { HeroService } from '../hero.service';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.css']
})
// export class HeroesComponent implements OnInit {
//   // hero = 'Windstorm';
//   // hero: Hero = {
//   //   id: 1,
//   //   name: 'Windstorm'
//   // };
//   // heroes = HEROES;
//   heroes: Hero[];
//   selectedHero: Hero;

//   onSelect(hero: Hero): void {
//     this.selectedHero = hero;
//     console.log(this.selectedHero);
//   }

//   getHeroes(): void {
//     this.heroService.getHeroes()
//         .subscribe(heroes => this.heroes = heroes);
//   }

//   constructor(private heroService: HeroService) { }

//   ngOnInit() {
//     this.getHeroes();
//   }
// }

export class HeroesComponent implements OnInit {
  heroes: Hero[];

  constructor(private heroService: HeroService) { }

  ngOnInit() {
    this.getHeroes();
  }

  getHeroes(): void {
    this.heroService.getHeroes()
    .subscribe(heroes => this.heroes = heroes);
  }
}
