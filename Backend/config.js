module.exports = {
    dbUrl: process.env.DB_URL || "mongodb://localhost/storiesClub",
    host: process.env.HOST || "localhost",
    port: process.env.PORT || 3000,
}