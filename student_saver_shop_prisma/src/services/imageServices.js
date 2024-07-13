import multer from 'multer';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

// Get __dirname equivalent
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Ensure directory exists
const ensureDirectoryExistence = (dir) => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
};

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const uploadPath = path.join(__dirname, '../../uploads/profile');
    ensureDirectoryExistence(uploadPath);
    cb(null, uploadPath);
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname);
  }
});

// Initialize Multer
const upload = multer({
  storage: storage,
  fileFilter: function (req, file, cb) {
    // console.log("File Type: ",file);
    // Accept images only
    if (!file.mimetype.startsWith('image/')) {
      return cb(new Error('Only images are allowed'), false);
    }
    cb(null, true);
  }
});

export default upload;
