const isLoggedIn = (req, res, next) => {
  next();
};
module.exports = { isLoggedIn };
