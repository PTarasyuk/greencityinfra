describe('Test', () => {
  it('Check if the user is not in the database', () => {
    cy.fixture('user').then((user) => {
        cy.queryDb("SELECT * FROM users WHERE email=$1", [user.email]).then((result) => {
            expect(result.length).to.eq(0); // Перевірка, що користувач не знайдений
            console.log('✅ User is not in the database');
        });
    });
  });

  it('Check if the Home page is loaded and the user is signed up', () => {
    cy.visit('http://localhost/');

    cy.get('div.ubsHomepage').should('exist').then(() => {
      console.log('✅ Home page is loaded');
    });

    cy.get('app-ubs').find('div.ubs-header_sign-up-btn').click();

    cy.get('app-sign-up').should('exist').then(() => {
      console.log('✅ SignUp page is loaded');
    });

    cy.fixture('user').then((user) => {
      cy.get('#email').type(user.email);
      cy.get('#firstName').type(user.username);
      cy.get('#password').type(user.password);
      cy.get('#repeatPassword').type(user.password);
      cy.get('button[type="submit"]').click();
      console.log('✅ User is signed up');
      cy.wait(4000);
    });
  });

  it('Check if the user is in the database', () => {
    cy.fixture('user').then((user) => {
      cy.queryDb("SELECT * FROM users WHERE email=$1", [user.email]).then((result) => {
        expect(result.length).to.eq(1);
        expect(result[0].email).to.eq(user.email);
        expect(result[0].name).to.eq(user.username);
        console.log('✅ User is in the database');
      });
    });
  });
});
