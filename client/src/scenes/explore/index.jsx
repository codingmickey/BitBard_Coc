import { Box, Typography, useTheme, useMediaQuery } from "@mui/material";
import Navbar from "../navbar";
import VideoCarousel from "./videoCarousel";
import reels from "../../assets/reels.avif";

const Explore = () => {
  const theme = useTheme();
  const isNonMobileScreens = useMediaQuery("(min-width: 1000px)");
  return (
    <Box>
        <Navbar />
        <Box

        style={{
          width: "100%",
          backgroundImage: `url(${reels})`,
          backgroundSize: "cover",
          backgroundPosition: "center",
          backgroundRepeat: "no-repeat",
          height: "100vh",
        }}
        >
          <VideoCarousel />
        </Box>
    </Box>
  );
};

export default Explore;

