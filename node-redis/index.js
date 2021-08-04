const express = require('express')
const redis = require('redis')

const app = express()
const client = redis.createClient({
    host: 'redis-server',
    port: 6379,
})
client.set('visits', 0)

app.get('/', () => {
    client.get('visits', (err, vistis) => {
        res.send('Numbers of visit is: ' + visits)
        client.set('visits', parseInt(visits) + 1)
    })
})

app.listen(8081, () => {
    console.log('listening on port 8081')
})