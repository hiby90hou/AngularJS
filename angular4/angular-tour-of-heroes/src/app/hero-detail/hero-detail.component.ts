import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

import { Hero } from '../hero';
import { HeroService } from '../hero.service';
import { TestService } from '../test.service';

@Component({
  selector: 'app-hero-detail',
  templateUrl: './hero-detail.component.html',
  styleUrls: [ './hero-detail.component.css' ]
})
export class HeroDetailComponent implements OnInit {
  @Input() hero: Hero;

  public test;

  constructor(
    private route: ActivatedRoute,
    private heroService: HeroService,
    private location: Location,
    // private _testService: TestService
  ) {
    // console.log(this._testService.getData());
    // this._testService.setData("test");
    // this.test = this._testService.getData();
  }

  
  // public test = 1;

  ngOnInit(): void {
    // this.getHero();
    this.route.data
    .subscribe((data) => {
      this.hero = data.hero;
      console.log(data)
    });
  }

  // getHero(): void {
  //   const id = +this.route.snapshot.paramMap.get('id');
  //   this.heroService.getHero(id)
  //     .subscribe(hero => this.hero = hero);
  // }

  save(): void {
    this.heroService.updateHero(this.hero)
      .subscribe(() => this.goBack());
  }

  goBack(): void {
    this.location.back();
  }
}
