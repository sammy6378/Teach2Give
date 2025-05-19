import express from 'express'
import 'dotenv/config'
import { connectDB } from './utils/db';
import { router } from './routes/db.routes';


const port = process.env.PORT || 3000;

const app = express()


app.get('/', (req, res) => {
  res.send('Hello World!')
})

// routes
app.use('/api', router)

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
  connectDB();
})


