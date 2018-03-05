const expect = require('chai').expect
import toFahrenheit from '../lib/celsiusToFahrenheit'

describe('check celsiusToFahrenheit', () => {

  it('should return 59 Fahrenheit if Celsius is 15', () => {
    expect(toFahrenheit(15)).to.be.equal(59)
  })

  it('should return -4 Fahrenheit if Celsius is -20', () => {
    expect(toFahrenheit(-20)).to.be.equal(-4)
  })


})