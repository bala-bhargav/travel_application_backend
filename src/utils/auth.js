import { UN_AUTHORIZED, INTERNAL_SERVER } from '../constants/index.js';

import env from '../config/env.js';
import AppError from './AppError.js';
import { findUserByRefreshToken, removeRefreshTokensUser } from '../services/auth.services.js';

import { decodeUser } from './user.js';

export const refreshTokenReuseDetection = async (decodedUser, refreshToken, res, next) => {
  console.log('decodedUser1', decodedUser);
  const refreshTokenFound = await findUserByRefreshToken(decodedUser.id, refreshToken);

  if (!refreshTokenFound) {
    await removeRefreshTokensUser(decodedUser.id);
    res.clearCookie('refreshToken');
    next(
      new AppError(
        {
          message: 'Refresh token is invalid!',
        },
        UN_AUTHORIZED
      )
    );
    return true;
  }
  return false;
};

export const handleRefreshTokenError = async (error, req, res, next) => {
  const { refreshToken } = req.cookies;
  let updatedUser = null;

  res.clearCookie('refreshToken');

  const decodedUser = decodeUser(refreshToken, env.jwt.refresh_secret);

  if (decodeUser) {
    updatedUser = await removeRefreshTokensUser(decodeUser.id, refreshToken);
  }

  if (error?.message === 'jwt expired') {
    if (updatedUser) {
      return next(
        new AppError(
          {
            message: 'Refresh token expired',
          },
          UN_AUTHORIZED
        )
      );
    }
  } else if (error?.message === 'jwt malformed') {
    return next(
      new AppError(
        {
          message: 'Refresh Token is malformed !',
        },
        UN_AUTHORIZED
      )
    );
  }

  return next(new AppError({ message: 'Something went wrong' }, INTERNAL_SERVER));
};
