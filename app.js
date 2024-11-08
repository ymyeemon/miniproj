const express = require('express');  
const multer = require('multer');   
const mysql = require('mysql2');     

const app = express();

// set up multer storage engine for file uploads
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/images');  // save uploaded files in the 'public/images' folder
    },
    filename: (req, file, cb) => {
        cb(null, file.originalname); // keep the original file name
    }
});

const upload = multer({ storage: storage }); // setting up multer with the storage engine

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'journals'

    // host: 'pro.freedb.tech',
    // user: 'teamfour',
    // password: '*wauWdA985W3rA?',
    // database: 'teamfourdb'

});

connection.connect((err) => {
if (err) {
console.error('Error connecting to MySQL:', err);
return;
}
console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');

// enable static files
app.use(express.static('public'));

// enable form processing
app.use(express.urlencoded({ extended: false }));


// R - view all journals
app.get("/", (req, res) => {
    
    // sql query to get all journals
    const sql = "SELECT * FROM journals"

    // execute the query
    connection.query(sql, (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('index', { journals:results }); // pass the results to the index.ejs file as journals
      });
    
});


//R - view journal by their ID
app.get("/journal/:id", (req, res) => {
    const journalId = req.params.id;  // get the journal id route parameter from the requested URL

    const sql = "SELECT * FROM journals WHERE journalId = ?"

    connection.query(sql, [journalId], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('journalInfo', { journal:results[0] }); // pass the first value in the results to the journalInfo.ejs file as journal
    });
});


// R - view about me page
app.get("/aboutme", (req, res) => {
    res.render('aboutme');
});

// R - view contact me page
app.get("/contactme", (req, res) => {
    res.render('contactme');
});


//C - display the add journal form
app.get("/addJournal", (req, res) => {
    res.render('addJournal');
});


//C - process adding journal form
app.post("/addJournal", upload.single('image'), (req, res) => {

    // get journal data from the request body
    const {location, period, title, text, date} = req.body;

    let image;
    if (req.file) {
        image = req.file.filename; // assign the file name of the uploaded image
    } else {
        image = 'default.jpg';  // if no image is uploaded, set the default image
    }

    const sql = "INSERT INTO journals (location, period, title, text, date, image) VALUES (?, ?, ?, ?, ?, ?)";
    
    // insert the new journal into the database
    connection.query(sql, [location, period, title, text, date, image], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.redirect("/");
    });
});


//U - display the edit journal form
app.get("/editJournal/:id", (req, res) => {
    const journalId = req.params.id;

    
    const sql = "SELECT * FROM journals WHERE journalId = ?";

    connection.query(sql, [journalId], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }

        // check if any journal with the given id was found
        if (results.length > 0) {
            res.render('editJournal', { journal:results[0] }); // pass the first value in the results to the editJournal.ejs file as journal
        }
        else { // if no product was found
            res.status(404).send("Journal not found"); 
        }
    });
});


// U - update/edit the journal
app.post("/editJournal/:id", upload.single('image'), (req,res) => {
    const journalId = req.params.id;
    const {location, period, title, text, date} = req.body;

    let image = req.body.currentImage; // retrieve current image filename
    if (req.file) {                    // if new image is uploaded
        image = req.file.filename;     // set image to be new image filename
    }

    const sql = "UPDATE journals SET location = ?,  period = ?, title = ?,  text = ?, date = ?, image = ? WHERE journalId = ?";

    connection.query(sql, [location, period, title, text, date, image, journalId], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        else {
            res.redirect("/");
        }
    });
});


// D - delete the journal
app.get("/deleteJournal/:id", (req, res) => {
    const journalId = req.params.id;
    const sql = "DELETE FROM journals WHERE journalId = ?";

    connection.query(sql, [journalId], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        else {
            res.redirect("/");
        }
    });
});


const PORT = process.env.PORT || 3005;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));0