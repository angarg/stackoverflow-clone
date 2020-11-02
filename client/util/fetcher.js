import axios from 'axios'

const baseURL = `http://${process.env.SITE_NAME}/api`

const publicFetch = axios.create({
  baseURL
})

export { publicFetch, baseURL }
