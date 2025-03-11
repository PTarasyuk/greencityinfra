const { defineConfig } = require("cypress");
// const { Client } = require('pg');
const { Pool } = require('pg');
require('dotenv').config();

module.exports = defineConfig({
  video: true,
  e2e: {
    setupNodeEvents(on, config) {
      config.env = {
        ...process.env,
        ...config.env,
      };

      const pool = new Pool({
        host: process.env.PG_HOST,
        port: parseInt(process.env.PG_PORT),
        database: process.env.PG_NAME,
        user: process.env.PG_USER,
        password: process.env.PG_PASSWORD,
      });

      on('task', {
        queryDb({ query, params }) {
          return pool.query(query, params)
              .then(result => result.rows)
              .catch(error => {
                console.error('❌ Error querying database:', error);
                throw error;
              });
        }
      });

      return config;
    },
  },
});
