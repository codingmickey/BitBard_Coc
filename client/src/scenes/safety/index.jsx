import React from 'react';
import { Box, Typography, useTheme, useMediaQuery, Grid } from "@mui/material";
import Navbar from "../navbar";
import Header from "./header";
import { useSelector } from 'react-redux';

const Safety = () => {
  
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);

  return (
    <Box>
        <Navbar />
        <Header />
    </Box>
  )
}

export default Safety;
