import { Box, Typography, useTheme, useMediaQuery } from "@mui/material";
import Navbar from "./navbar";
import HeadCarousel from "./carousel"
import Head from "./head"

const Landing = () => {
  const theme = useTheme();
  const isNonMobileScreens = useMediaQuery("(min-width: 1000px)");
  return (
    <Box>
        <Navbar />
        <HeadCarousel />
        <Head />
    </Box>
  );
};

export default Landing;
