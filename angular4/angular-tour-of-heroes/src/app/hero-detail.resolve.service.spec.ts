import { TestBed, inject } from '@angular/core/testing';

import { HeroDetailResolve } from './hero-detail.resolve.service';

describe('HeroDetailResolve', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [HeroDetailResolve]
    });
  });

  it('should be created', inject([HeroDetailResolve], (service: HeroDetailResolve) => {
    expect(service).toBeTruthy();
  }));
});
