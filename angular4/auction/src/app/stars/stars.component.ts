import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-stars',
  templateUrl: './stars.component.html',
  styleUrls: ['./stars.component.css']
})
export class StarsComponent implements OnInit {
  @Input()
  public rating;
  public stars: boolean[];
  constructor() { }

  ngOnInit() {
    // this.stars = [false, true, true, true, true];
    this.stars = [];
    for (let i = 0; i < 5; i++) {
      this.stars.push(i + 1 > this.rating);
    }
  }

}
