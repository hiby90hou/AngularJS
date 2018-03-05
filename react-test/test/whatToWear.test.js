const expect = require('chai').expect
import wearWhat from '../lib/whatToWear'

describe('check whatToWear', () => {

  it('should return T-shirt by default', () => {
    expect(wearWhat(17)).to.be.equal('T-shirt')
  })

  it('should return hoody if temperature less then 15 and more then 10', () => {
    expect(wearWhat(13)).to.be.equal('hoody')
  })

  it('should return Interchange Jacket if temperature less then 10', () => {
    expect(wearWhat(5)).to.be.equal('Interchange Jacket')
  })
})