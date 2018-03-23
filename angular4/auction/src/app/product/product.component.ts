import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  // private products: Array<Product>;
  public products: Array<Product>;
  public imgUrl = 'http://via.placeholder.com/320x150';
  constructor() { }

  ngOnInit() {
    this.products = [
      new Product(1, 'my pony', 1.99, 3.5, 'description about product one', ['toy', 'girls']),
      new Product(1, 'my pony2', 2.99, 3.0, 'description about product two', ['toy', 'boys']),
      new Product(1, 'my pony2', 2.99, 3.0, 'description about product two', ['toy', 'boys']),
      new Product(1, 'my pony2', 2.99, 3.0, 'description about product two', ['toy', 'boys']),
      new Product(1, 'my pony3', 2.99, 1.0, 'description about product three', ['toy', 'girls'])
    ];
  }

}

export class Product {
  constructor(
    public id: number,
    public title: string,
    public price: number,
    public rating: number,
    public desc: string,
    public categories: Array<string>
  ) {

  }
}
