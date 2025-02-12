import cors from 'cors';
import express from 'express';
import helmet from 'helmet';
import morgan from 'morgan';
import cookieParser from 'cookie-parser';

import { fileURLToPath } from 'url';
import * as path from 'path';
const __dirname = path.dirname(fileURLToPath(import.meta.url));
import logger from './logger.js';

import authRoutes from '../routes/auth.routes.js';
import adminRoutes from '../routes/user.routes.js';
import travellerRoutes from '../routes/traveller.routes.js';
import busRoutes from '../routes/bus.routes.js';
import busOwnerRoutes from '../routes/busOwner.routes.js';
import paymentRoutes from '../routes/payment.routes.js';
import SearchRoutes from '../routes/search.routes.js';
import seatRoutes from '../routes/seat.routes.js';
import stopRoutes from '../routes/stop.routes.js';
import TicketRoutes from '../routes/ticket.routes.js';
import bookingHistoryRoutes from '../routes/bookingHistory.routes.js';

const app = express();

app.use(helmet());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan('dev'));

app.use(
  cors({
    origin: 'http://localhost:5173',
    credentials: true,
  })
);
app.use(cookieParser());

// view engine
app.set('view engine', 'ejs');
app.set('views', path.resolve(__dirname, '../views'));

app.get('/', (req, res) => {
  return res.render('home');
});

app.use((req, res, next) => {
  logger.info(`${req.method} ${req.url}`);
  next();
});

app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/admin', adminRoutes);
app.use('/api/v1/traveller', travellerRoutes);
app.use('/api/v1/bus', busRoutes);
app.use('/api/v1/busOwner', busOwnerRoutes);
app.use('/api/v1/payment', paymentRoutes);
app.use('/api/v1/search', SearchRoutes);
app.use('/api/v1/seat', seatRoutes);
app.use('/api/v1/stop', stopRoutes);
app.use('/api/v1/ticket', TicketRoutes);
app.use('/api/v1/booking', bookingHistoryRoutes);


export default app;
