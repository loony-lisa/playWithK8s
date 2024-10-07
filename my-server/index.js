// https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md
const express = require('express');
const mariadb = require('mariadb');

const app = express();

app.use(express.json());

async function asyncFunction(req, res) {
  const conn = await mariadb.createConnection({
    host: 'mariadb-service.pcc.svc.cluster.local',
    user: 'root',
    password: 'mysecret',
    database: 'beverage',
  });

  try {
    const res = await conn.query("SELECT * FROM drinks");
    console.log(res);
    return res;
  } finally {
    conn.end();
  }
}


app.get('/api/drink', async (req, res) => {
  const result = await asyncFunction(); // 使用异步函数
  res.json(result); // 返回 JSON 对象
});


const port = 3000;
app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
