import { Injectable } from '@angular/core';

@Injectable()
export class TestService {
  public sharedData:string;

  constructor() { 
    this.sharedData = "this is a test value";
  }

  setData(data){
    this.sharedData = data;
  }
  getData(){
    return this.sharedData;
  }

}
