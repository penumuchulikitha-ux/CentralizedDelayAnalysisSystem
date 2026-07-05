<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Centralized Delay Analysis System</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
:root{
    --indigo:#1B1464;
    --violet:#6C4CE0;
    --coral:#FF5C77;
    --amber:#FFB627;
    --teal:#14B8A6;
    --paper:#F7F7FB;
    --ink:#1B1464;
    --line:#E4E1F5;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    min-height:100vh;
    font-family:'Inter',sans-serif;
    background:
        radial-gradient(circle at 15% 20%, rgba(255,92,119,0.35), transparent 40%),
        radial-gradient(circle at 85% 80%, rgba(20,184,166,0.30), transparent 45%),
        linear-gradient(135deg,var(--indigo),var(--violet) 60%,#8B5CF6);
    display:flex;
    justify-content:center;
    align-items:center;
    padding:24px;
    overflow:hidden;
}

.wrap{
    display:flex;
    width:100%;
    max-width:940px;
    min-height:560px;
    background:rgba(255,255,255,0.06);
    border:1px solid rgba(255,255,255,0.18);
    border-radius:24px;
    overflow:hidden;
    box-shadow:0 30px 60px rgba(10,5,40,0.45);
    backdrop-filter:blur(6px);
}

/* ---------- LEFT: live delay ticker panel ---------- */
.panel{
    flex:1.1;
    padding:44px 40px;
    color:#fff;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    background:linear-gradient(160deg, rgba(255,255,255,0.10), rgba(255,255,255,0.02));
    position:relative;
}

.brand{
    display:flex;
    align-items:center;
    gap:12px;
}

.gear{
    width:44px;height:44px;
    border-radius:12px;
    background:linear-gradient(135deg,var(--amber),var(--coral));
    display:flex;align-items:center;justify-content:center;
    font-size:22px;
    animation:spin 12s linear infinite;
    flex-shrink:0;
}

@keyframes spin{ to{ transform:rotate(360deg); } }

.brand-text{
    font-family:'Space Grotesk',sans-serif;
    font-weight:600;
    font-size:15px;
    line-height:1.3;
    letter-spacing:0.3px;
}
.brand-text span{
    display:block;
    font-size:11px;
    font-weight:500;
    opacity:0.65;
    letter-spacing:1.5px;
    text-transform:uppercase;
    margin-top:2px;
}

.headline{
    font-family:'Space Grotesk',sans-serif;
    font-size:32px;
    font-weight:700;
    line-height:1.25;
    margin-top:36px;
}
.headline em{
    font-style:normal;
    background:linear-gradient(90deg,var(--amber),var(--coral));
    -webkit-background-clip:text;
    background-clip:text;
    color:transparent;
}

.sub{
    margin-top:12px;
    font-size:14px;
    line-height:1.6;
    color:rgba(255,255,255,0.72);
    max-width:360px;
}

/* ticker cards */
.ticker{
    margin-top:32px;
    display:flex;
    flex-direction:column;
    gap:10px;
}
.line-card{
    display:flex;
    align-items:center;
    justify-content:space-between;
    background:rgba(255,255,255,0.08);
    border:1px solid rgba(255,255,255,0.12);
    border-radius:12px;
    padding:11px 14px;
    font-family:'JetBrains Mono',monospace;
    font-size:12.5px;
    opacity:0;
    animation:rise 0.6s ease forwards;
}
.line-card:nth-child(1){animation-delay:.15s}
.line-card:nth-child(2){animation-delay:.30s}
.line-card:nth-child(3){animation-delay:.45s}

@keyframes rise{
    from{opacity:0; transform:translateY(8px);}
    to{opacity:1; transform:translateY(0);}
}

.line-name{display:flex;align-items:center;gap:10px;color:#fff;font-weight:500;}
.dot{width:8px;height:8px;border-radius:50%;flex-shrink:0;}
.dot.ok{background:var(--teal); box-shadow:0 0 0 4px rgba(20,184,166,0.25);}
.dot.warn{background:var(--amber); box-shadow:0 0 0 4px rgba(255,182,39,0.25); animation:pulse 1.6s infinite;}
.dot.late{background:var(--coral); box-shadow:0 0 0 4px rgba(255,92,119,0.25); animation:pulse 1.6s infinite;}
@keyframes pulse{
    0%,100%{transform:scale(1);}
    50%{transform:scale(1.35);}
}

.status-pill{
    padding:3px 9px;
    border-radius:20px;
    font-size:11px;
    letter-spacing:0.3px;
}
.status-pill.ok{color:var(--teal); background:rgba(20,184,166,0.15);}
.status-pill.warn{color:var(--amber); background:rgba(255,182,39,0.15);}
.status-pill.late{color:var(--coral); background:rgba(255,92,119,0.15);}

.foot-note{
    font-size:11px;
    color:rgba(255,255,255,0.45);
    font-family:'JetBrains Mono',monospace;
    display:flex;
    align-items:center;
    gap:8px;
}
.foot-note .blip{
    width:6px;height:6px;border-radius:50%;
    background:var(--teal);
    animation:pulse 1.6s infinite;
}

/* ---------- RIGHT: form panel ---------- */
.form-side{
    flex:1;
    background:var(--paper);
    padding:48px 44px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.form-side h2{
    font-family:'Space Grotesk',sans-serif;
    font-size:24px;
    font-weight:700;
    color:var(--ink);
}
.form-side p.hint{
    margin-top:6px;
    font-size:13.5px;
    color:#6B6B8D;
    margin-bottom:28px;
}

.field{
    position:relative;
    margin-bottom:16px;
}
.field label{
    display:block;
    font-size:12px;
    font-weight:600;
    color:#5B5B82;
    margin-bottom:6px;
    letter-spacing:0.2px;
}
.field .icon{
    position:absolute;
    left:14px;
    top:38px;
    opacity:0.5;
    font-size:15px;
    pointer-events:none;
}
.field input{
    width:100%;
    padding:12px 14px 12px 38px;
    border:1.5px solid var(--line);
    border-radius:10px;
    font-size:14px;
    font-family:'Inter',sans-serif;
    color:var(--ink);
    background:#fff;
    transition:border-color .18s, box-shadow .18s;
}
.field input:focus{
    outline:none;
    border-color:var(--violet);
    box-shadow:0 0 0 4px rgba(108,76,224,0.14);
}

.toggle-pass{
    position:absolute;
    right:12px;
    top:37px;
    background:none;
    border:none;
    cursor:pointer;
    font-size:13px;
    color:#8686A8;
    font-family:'Inter',sans-serif;
    font-weight:500;
}
.toggle-pass:hover{ color:var(--violet); }

.capslock-warn{
    font-size:11.5px;
    color:var(--coral);
    margin-top:-10px;
    margin-bottom:12px;
    display:none;
    font-weight:500;
}

.row-between{
    display:flex;
    align-items:center;
    justify-content:space-between;
    margin:6px 0 20px;
    font-size:13px;
}
.remember{
    display:flex;
    align-items:center;
    gap:7px;
    color:#5B5B82;
}
.remember input{
    width:14px;height:14px;
    accent-color:var(--violet);
}
.forgot{
    color:var(--violet);
    text-decoration:none;
    font-weight:600;
}
.forgot:hover{ text-decoration:underline; }

button.submit{
    width:100%;
    padding:13px;
    border:none;
    border-radius:10px;
    font-size:14.5px;
    font-weight:600;
    font-family:'Space Grotesk',sans-serif;
    letter-spacing:0.3px;
    color:#fff;
    cursor:pointer;
    background:linear-gradient(90deg,var(--violet),var(--coral));
    background-size:160% 100%;
    background-position:0% 0%;
    transition:background-position .35s ease, transform .12s ease;
    box-shadow:0 10px 22px rgba(108,76,224,0.35);
}
button.submit:hover{ background-position:100% 0%; }
button.submit:active{ transform:translateY(1px); }

.divider{
    display:flex;
    align-items:center;
    gap:10px;
    margin:22px 0 16px;
    color:#A6A6C4;
    font-size:11px;
    letter-spacing:0.5px;
    text-transform:uppercase;
}
.divider::before,.divider::after{
    content:"";
    flex:1;
    height:1px;
    background:var(--line);
}

.help-line{
    text-align:center;
    font-size:12.5px;
    color:#6B6B8D;
}
.help-line a{ color:var(--violet); font-weight:600; text-decoration:none; }
.help-line a:hover{ text-decoration:underline; }

@media (max-width:760px){
    .wrap{ flex-direction:column; }
    .panel{ padding:32px 28px; }
    .headline{ font-size:24px; }
    .form-side{ padding:36px 28px; }
}
</style>
</head>
<body>

<div class="wrap">

    <!-- LEFT: brand + live-status signature panel -->
    <div class="panel">
        <div>
            <div class="brand">
                <div class="gear">⚙</div>
                <div class="brand-text">
                    Centralized Delay
                    <span>Analysis System</span>
                </div>
            </div>

            <div class="headline">Know the delay <em>before</em> it becomes a problem.</div>
            <div class="sub">Real-time schedule variance tracking across every monitored line, in one console.</div>

            <div class="ticker">
                <div class="line-card">
                    <div class="line-name"><span class="dot ok"></span>Line&nbsp;A &mdash; North Corridor</div>
                    <div class="status-pill ok">ON TIME</div>
                </div>
                <div class="line-card">
                    <div class="line-name"><span class="dot warn"></span>Line&nbsp;B &mdash; Central Loop</div>
                    <div class="status-pill warn">+6 MIN</div>
                </div>
                <div class="line-card">
                    <div class="line-name"><span class="dot late"></span>Line&nbsp;C &mdash; East Junction</div>
                    <div class="status-pill late">+18 MIN</div>
                </div>
            </div>
        </div>

        <div class="foot-note"><span class="blip"></span>SYSTEM STATUS: OPERATIONAL &nbsp;|&nbsp; v2.4</div>
    </div>

    <!-- RIGHT: login form -->
    <div class="form-side">
        <h2>Welcome back</h2>
        <p class="hint">Sign in with your employee credentials to continue.</p>

        <form action="LoginServlet" method="post" id="loginForm">

            <div class="field">
                <label for="empNo">Employee Number</label>
                <span class="icon">&#128100;</span>
                <input type="text" id="empNo" name="empNo" placeholder="e.g. EMP-1042" required autocomplete="username">
            </div>

            <div class="field">
                <label for="password">Password</label>
                <span class="icon">&#128274;</span>
                <input type="password" id="password" name="password" placeholder="Enter password" required autocomplete="current-password">
                <button type="button" class="toggle-pass" id="togglePass">Show</button>
            </div>
            <div class="capslock-warn" id="capsWarn">⚠ Caps Lock is on</div>

            <div class="row-between">
                <label class="remember">
                    <input type="checkbox" name="rememberMe">
                    Remember me
                </label>
                <a href="ForgotPassword.jsp" class="forgot">Forgot password?</a>
            </div>

            <button type="submit" class="submit">Login to Dashboard</button>
        </form>

        <div class="divider">Need Access</div>
        <p class="help-line">Trouble signing in? <a href="mailto:support@cdas.local">Contact system administrator</a></p>
    </div>

</div>

<script>
// Show / hide password
const toggleBtn = document.getElementById('togglePass');
const passInput = document.getElementById('password');
toggleBtn.addEventListener('click', function(){
    const isHidden = passInput.type === 'password';
    passInput.type = isHidden ? 'text' : 'password';
    toggleBtn.textContent = isHidden ? 'Hide' : 'Show';
});

// Caps Lock detection
const capsWarn = document.getElementById('capsWarn');
passInput.addEventListener('keyup', function(e){
    const caps = e.getModifierState && e.getModifierState('CapsLock');
    capsWarn.style.display = caps ? 'block' : 'none';
});
passInput.addEventListener('blur', function(){
    capsWarn.style.display = 'none';
});
</script>

</body>
</html>
