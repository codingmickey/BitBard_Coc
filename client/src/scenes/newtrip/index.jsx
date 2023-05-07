import { Box, Typography, useTheme, useMediaQuery } from "@mui/material";
import Navbar from "../navbar";
import Form from "./form";
import make from "../../assets/make.avif";

const NewTrip = () => {
  const theme = useTheme();
  const isNonMobileScreens = useMediaQuery("(min-width: 1000px)");
  return (
    <Box>
        <Navbar />
        <Box
        sx={{
          backgroundImage: `url(${make})`,
          backgroundSize: "cover",
          backgroundPosition: "center",
          backgroundRepeat: "no-repeat",
          height: "100vh",
        }}
        >
        <Form />
        </Box>
    </Box>
  );
};

export default NewTrip;
