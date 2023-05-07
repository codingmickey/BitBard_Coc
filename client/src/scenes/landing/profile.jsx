import React from "react";
// import { makeStyles } from "@material-ui/core/styles";
// import Card from "@material-ui/core/Card";
// import CardMedia from "@material-ui/core/CardMedia";
// import CardContent from "@material-ui/core/CardContent";
// import Avatar from "@material-ui/core/Avatar";
// import Badge from "@material-ui/core/Badge";
// import Typography from "@material-ui/core/Typography";
import {
    Box,
    Card,
    CardContent,
    CardMedia,
    Typography,
    Badge,
    Avatar,
} from "@mui/material"

const ProfileCard = ({ name, imageUrl, flagUrl }) => {

  return (
    <Box sx={{maxWidth:"345px", p:3, display:'flex', flexDirection:'column'}}>
        <img src={imageUrl} alt="" style={{
            height: '200px',
            width: '200px',
            borderRadius: '50%',
            margin: 'auto',
        }}/>
        <Box sx={{width:'100%',m:'auto', display:'flex', flexDirection:'row', justifyContent:'center', alignItems:'center',mt:2}}>
            <img src={flagUrl} alt="" height={30} width={30} />
            <Typography variant="h5" component="div" sx={{ml:2}}>
                {name}
            </Typography>
        </Box>
    </Box>
  );
};

export default ProfileCard;
