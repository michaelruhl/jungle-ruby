// const { first } = require("cypress/types/lodash");

describe('jungle ruby app', () => {
    beforeEach(() => {
      cy.visit('http://localhost:3000')
      
    })
    it("There is products on the page", () => {
        cy.get(".products article").should("be.visible");
      });
      it("There is 2 products on the page", () => {
        cy.get(".products article").should("have.length", 2);
      });
      it("Click first product on page", () => {
        cy.get('.products article').first().click()
      });
})