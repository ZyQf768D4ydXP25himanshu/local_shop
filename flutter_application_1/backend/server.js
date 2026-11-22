const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const h3 = require('h3-js');

const app = express();
app.use(express.json());

const server = http.createServer(app);
const io = new Server(server, { cors: { origin: "*" } });

const stores = [
  {
    id: "store_1",
    name: "Gupta Kirana Store",
    lat: 28.5355,
    lng: 77.3910,
    h3Index: h3.latLngToCell(28.5355, 77.3910, 9),
    inventory: [
      { name: "Aashirvaad Atta 5kg", price: 230, inStock: true },
      { name: "Amul Butter 500g", price: 275, inStock: true }
    ]
  },
  {
    id: "store_2",
    name: "SuperMart Express",
    lat: 28.5380,
    lng: 77.3940,
    h3Index: h3.latLngToCell(28.5380, 77.3940, 9),
    inventory: [
      { name: "Aashirvaad Atta 5kg", price: 225, inStock: true }
    ]
  }
];

app.post('/api/search', (req, res) => {
  const { query, lat, lng } = req.body;
  const userH3Index = h3.latLngToCell(lat, lng, 9);
  const nearbyHexagons = h3.gridDisk(userH3Index, 2);

  let results = [];
  stores.forEach(store => {
    if (nearbyHexagons.includes(store.h3Index)) {
      store.inventory.forEach(item => {
        if (item.name.toLowerCase().includes(query.toLowerCase()) && item.inStock) {
          results.push({
            storeName: store.name,
            h3Index: store.h3Index,
            product: item.name,
            price: item.price,
            distanceMeters: Math.round(h3.greatCircleDistance([lat, lng], [store.lat, store.lng], 'm'))
          });
        }
      });
    }
  });

  results.sort((a, b) => a.price - b.price || a.distanceMeters - b.distanceMeters);
  res.json({ success: true, userHexagon: userH3Index, results });
});

io.on('connection', (socket) => {
  socket.on('join_merchant_room', (merchantId) => socket.join(merchantId));
  socket.on('place_pickup_order', (orderData) => {
    io.to(orderData.merchantId).emit('incoming_pickup_alert', orderData);
  });
});

server.listen(3000, () => console.log("Hyperlocal Spatial Backend running on port 3000"));
