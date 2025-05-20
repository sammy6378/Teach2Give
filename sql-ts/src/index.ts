import express from 'express'
import 'dotenv/config'
import { connectDB } from './utils/db';
import { router } from './routes/db.routes';
import { userRouter } from './routes/user.routes';


const port = process.env.PORT || 3000;

const app = express()
app.use(express.json());
app.use(express.urlencoded({ extended: true,limit: '50mb' }));


app.get('/', (req, res) => {
  res.send('Hello World!')
})

// routes
app.use('/api', router)
app.use("/api/users",userRouter)

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
  connectDB();
})


