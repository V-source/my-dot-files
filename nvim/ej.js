import express from 'express'
const server = express()
const port = process.env.PORT || 3000


server.use(express.json())
server.use(express.urlencoded({extended: false}))



server.get('/', (req, res) => {
  res.status(200).json({msg: 'express server'})
  console.log(200)
})
