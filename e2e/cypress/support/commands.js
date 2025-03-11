Cypress.Commands.add('queryDb', (query, params) => {
  return cy.task('queryDb', {query, params});
});
