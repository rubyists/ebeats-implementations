var timer;


function date_str(dt)
{
  var y = dt.getUTCFullYear();
  var m = dt.getUTCMonth() + 1;
  var d = dt.getUTCDate();

  return "d" + y + "." + (m < 10 ? "0" + m : m) + "." + (d < 10 ? "0" + d : d);
}

function beats(dt)
{
  if(dt != undefined) {
    var b = (dt.getUTCHours()   * (1000.0 / 24.0)) +
            (dt.getUTCMinutes() * (1000.0 / 1440.0)) +
            (dt.getUTCSeconds() * (1000.0 / 86400.0));
    b = Math.round(b * 100) / 100;
  }
  else {
    b = 0;
  }

  return b;
}

function beats_str(b)
{
  var s = b.toString().split(".");

  if(s.length == 2) {
    return s[1].length == 1 ? "@" + b + "0" : "@" + b;
  }
  else {
    return "@" + b + ".00";
  }
}

function draw_clock(dt)
{
  var _beats = beats(dt);
  var _beats_str = beats_str(_beats);

  var canvas = document.getElementById("clock_canvas");
  var ctx = canvas.getContext("2d");

  var w = canvas.width - 20;
  var h = canvas.height - 20;
  var line_w = w * 0.05;

  var hand_rotation = ((_beats * 0.36) - 90) * Math.PI / 180;

  ctx.save();
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Move to the center
    ctx.translate(canvas.width / 2, canvas.height / 2);

    // Clock Face
    ctx.save();
      ctx.fillStyle = "rgba(16,76,99,1)";
      ctx.beginPath();
      ctx.arc(0, 0, (w / 2) - (line_w / 2), 0, Math.PI * 2, true); 
      ctx.closePath();
      ctx.fill();
    ctx.restore();

    // Face Border
    ctx.save();
      ctx.strokeStyle = "rgba(71,107,120,1)";
      ctx.shadowBlur = line_w;
      ctx.shadowColor = "rgba(0,0,0,0.8)";
      ctx.lineWidth = line_w;
      ctx.beginPath();
      ctx.arc(0, 0, (w / 2) - (line_w / 2), 0, Math.PI * 2, true); 
      ctx.closePath();
      ctx.stroke();
    ctx.restore();

    // Face Labels
    ctx.save();
      ctx.font = line_w.toString() + "px sans-serif";
      ctx.fillStyle = "rgba(144,208,232,1)";
      ctx.textAlign = "center";
      
      // 1000
      ctx.save();
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("1000", 0, 0);
      ctx.restore();

      // 125
      ctx.save();
        ctx.rotate(45 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("125", 0, 0);
      ctx.restore();

      // 250
      ctx.save();
        ctx.rotate(90 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("250", 0, 0);
      ctx.restore();

      // 375
      ctx.save();
        ctx.rotate(135 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("375", 0, 0);
      ctx.restore();

      // 500
      ctx.save();
        ctx.rotate(180 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("500", 0, 0);
      ctx.restore();

      // 625
      ctx.save();
        ctx.rotate(225 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("625", 0, 0);
      ctx.restore();

      // 750
      ctx.save();
        ctx.rotate(270 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("750", 0, 0);
      ctx.restore();

      // 875
      ctx.save();
        ctx.rotate(315 * Math.PI / 180);
        ctx.translate(0, -(h / 2) + (line_w - 1));
        ctx.fillText("875", 0, 0);
      ctx.restore();
    ctx.restore();

    ctx.save();
      ctx.rotate(hand_rotation);

      // Clock Hand
      ctx.fillStyle = "rgba(71,107,120,1)";
      ctx.beginPath();
      ctx.lineTo(0, ((line_w / 2) + 1));
      ctx.lineTo((w / 2) - (line_w + 4), ((line_w / 2) + 1));
      ctx.lineTo((w / 2) - (line_w + 4), -((line_w / 2) + 1));
      ctx.lineTo(0, -((line_w / 2) + 1));
      ctx.closePath();
      ctx.fill();

      // Beats
      ctx.fillStyle = "rgba(144,208,232,1)";
      ctx.font = (line_w * 1.2).toString() + "px sans-serif";
      ctx.fillText(_beats_str, line_w * 3.5, line_w * 0.4, (w / 2) - line_w);
    ctx.restore();

    ctx.save();
      // Date String
      ctx.translate(0, -(line_w * 2));
      ctx.font = (line_w * 1.6).toString() + "px sans-serif";
      ctx.fillStyle = "rgba(200,200,200,1)";
      ctx.textAlign = "center";
      ctx.fillText(date_str(dt), 0, 0);

      // ebeats.org
      ctx.translate(0, line_w);
      ctx.font = (line_w * 0.8).toString() + "px sans-serif";
      ctx.fillText("ebeats.org", 0, 0);
    ctx.restore();

    // Gloss
    ctx.save();
      var gloss = ctx.createLinearGradient(0, -(w / 2), 0, 0);
      gloss.addColorStop(0, "rgba(255,255,255,0.3)");
      gloss.addColorStop(1, "rgba(255,255,255,0)");
      ctx.fillStyle = gloss;
      ctx.beginPath();
      ctx.arc(0, 0, (w / 2) - line_w, 15 * Math.PI / 180, -195 * Math.PI / 180, true);
      ctx.closePath();
      ctx.fill();
    ctx.restore();

  ctx.restore();
}

function onshow()
{
  if(timer == null) {
    draw_clock(new Date());
    timer = setInterval("draw_clock(new Date());", 1000);
  }

  return 0;
}

function onhide()
{
  if(timer != null) {
    clearInterval(timer);
    timer = null;
  }
}

if(window.widget) {
  widget.onshow = onshow;
  widget.onhide = onhide;
}
