const expect = require('chai').expect
import getData from '../lib/dataProcess'
import "isomorphic-fetch"

describe('check dataProcess', () => {
  it('should return 200 by default', async () => {
			const response = await getData()
			console.log(response);
			expect(response['cod']).to.be.equal(200)
  })
})