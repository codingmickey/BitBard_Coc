import { Box, Typography, useTheme, useMediaQuery } from "@mui/material";
import Navbar from "../navbar";
import VideoCarousel from "./videoCarousel";

const Explore = () => {
  const theme = useTheme();
  const isNonMobileScreens = useMediaQuery("(min-width: 1000px)");
  return (
    <Box>
        <Navbar />
        <Box>
          <VideoCarousel />
        </Box>
    </Box>
  );
};

export default Explore;

