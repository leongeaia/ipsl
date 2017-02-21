within iPSL.Electrical.Loads.Eurostag;
model PwLoadVoltageDependence
  "Load with voltage dependence.Developed by AIA. 2014/03/10"
 extends iPSL.Electrical.Essentials.pfComponent;
 inner iPSL.Electrical.SystemBase SysData;
  iPSL.Connectors.PwPin p(vr(start=Vo_real),  vi(start=Vo_img),  ir(start=1), ii(start=0)) annotation(Placement(transformation(extent = {{-80, 0}, {-60, 20}}), iconTransformation(extent = {{-80, 0}, {-60, 20}})));
  parameter Real Vo_real = V_0 * cos(angle_0 * Modelica.Constants.pi / 180) "Initial voltage at node in p.u. (Real part)";
  parameter Real Vo_img = V_0 * sin(angle_0 * Modelica.Constants.pi / 180) "Initial voltage at node in p.u. (Imaginary part)";
  parameter Real vo = sqrt(Vo_real ^ 2 + Vo_img ^ 2);
  Real v(start = vo);
  Real a(start = 1) "auxiliary variable. Voltage division";
  parameter Real alpha = 0;
  parameter Real beta = 0;
  Real P(start = P_0/S_b);
  Real Q(start = Q_0/S_b);

equation
  a = v / vo;
  (P_0 / S_b) * (a ^ alpha) = p.vr * p.ir + p.vi * p.ii;
  (Q_0 / S_b)* (a ^ beta)  = (-p.vr * p.ii) + p.vi * p.ir;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  P = p.vr * p.ir + p.vi * p.ii;
  Q = (-p.vr * p.ii) + p.vi * p.ir;
  annotation (
    Placement(transformation(extent={{-56,-10},{-36,10}}), iconTransformation(extent={{-80,0},{-60,20}})),
    Diagram(graphics),
    Icon(graphics={Rectangle(extent={{-60,60},{40,-40}}, lineColor={0,0,255}),Rectangle(extent={{-40,40},{20,-20}}, lineColor={0,0,255}),Line(
          points={{-40,40},{20,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,-20},{20,40}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end PwLoadVoltageDependence;
