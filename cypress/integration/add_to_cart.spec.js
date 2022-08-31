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
      it("Click first add button", () => {
        cy.contains("My Cart (0)")

        cy.get('.btn').first().click({force: true})
        cy.contains("My Cart (1)")
      });
})