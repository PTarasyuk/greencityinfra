const cypress = require('cypress');

async function runTests() {
  try {
    console.log('➡️ Running test...');
    let result = await cypress.run({ spec: 'cypress/e2e/test.cy.js', video: true });
    if (result.totalFailed > 0) {
      console.error('❌ Test failed. Stopping execution.');
      process.exit(1);
    }

    console.log('✅ All tests passed successfully!');
  } catch (error) {
    console.error('❌ Error running tests:', error);
    process.exit(1);
  }
}

runTests();
