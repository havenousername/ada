with ada.Text_IO;
use ada.Text_IO;

procedure trafficlight is
   type Color is (red, yellow, green);
   protected lamp is 
      procedure change;
      function isColor return color;
   private 
      lamp : Color := green;
