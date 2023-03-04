import { Box, Typography, useTheme, useMediaQuery } from "@mui/material";
import Navbar from "../navbar";
import Form from "./form";

const NewTrip = () => {
  const theme = useTheme();
  const isNonMobileScreens = useMediaQuery("(min-width: 1000px)");
  return (
    <Box>
        <Navbar />
        <Box>
        <Form />
        </Box>
    </Box>
  );
};

export default NewTrip;
