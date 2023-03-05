// import React, { useState } from 'react';
// import { ComposableMap, Geographies, Geography, Marker } from 'react-simple-maps';
// // import worldData from './worldData.json';

// const visitedCountries = ['Canada', 'United States', 'Mexico']; // Example list of visited countries

// const WorldMap = () => {
//   const [tooltipContent, setTooltipContent] = useState('');

//   return (
//     <div>
//       <ComposableMap projection="geoMercator" height={500}>
//         <Geographies geography={worldData}>
//           {({ geographies }) =>
//             geographies.map((geo) => (
//               <Geography
//                 key={geo.rsmKey}
//                 geography={geo}
//                 onMouseEnter={() => {
//                   const { NAME } = geo.properties;
//                   setTooltipContent(`${NAME}`);
//                 }}
//                 onMouseLeave={() => {
//                   setTooltipContent('');
//                 }}
//                 style={{
//                   default: {
//                     fill: visitedCountries.includes(geo.properties.NAME) ? '#F53' : '#D6D6DA',
//                     outline: 'none'
//                   },
//                   hover: {
//                     fill: visitedCountries.includes(geo.properties.NAME) ? '#F53' : '#F53',
//                     outline: 'none'
//                   },
//                   pressed: {
//                     fill: visitedCountries.includes(geo.properties.NAME) ? '#F53' : '#F53',
//                     outline: 'none'
//                   }
//                 }}
//               />
//             ))
//           }
//         </Geographies>
//         {visitedCountries.map((country) => {
//           const geo = worldData.features.find((geo) => geo.properties.NAME === country);
//           if (geo) {
//             return (
//               <Marker key={country} coordinates={[geo.properties.ISO_A3]}>
//                 <circle r={6} fill="#F53" />
//               </Marker>
//             );
//           } else {
//             return null;
//           }
//         })}
//       </ComposableMap>
//       <div style={{ marginTop: '20px' }}>{tooltipContent}</div>
//     </div>
//   );
// };

// export default WorldMap;
