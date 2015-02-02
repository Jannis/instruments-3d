/**
 * 3D CAD model of a jig for milling the outside of drum shells.
 * Inspired by Murray Drums (https://www.youtube.com/watch?v=dOMvS0FD7M8),
 * with added features.
 * -
 * Copyright (c) 2015 Jannis Pohlmann <jannis@xfce.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * The jig consists of a base board/table to which a router is mounted from
 * below and a mount for drum shells of different sizes, based on a threaded
 * rod. Its purpose is to make a drum shell round and flush from the outside.
 * It is to be used before the shell is round from the inside.
 *
 * Two round, ideally-sized wooden template plates are attached to the
 * shell from both sides. Four large screws stick out of each plate according
 * to the inner diameter of the shell and are used to anchor the shell and
 * hold it in place without having to drill holes into it.
 *
 * The two round plates have two holes exactly in the middle, into which
 * hex nuts are inserted such that they don't turn. The round plates are
 * then placed inbetween two panels (each again with a hole drilled in the
 * center) that are slightly bigger and therefor hold the drum shell up in
 * the air. These outer panels have a fixed distance to prevent the shell
 * from moving around towards the sides.
 *
 * The above shell mount is then put onto a threaded rod such that the hex
 * nuts in the shell templates allow to move the shell along the rod as it
 * is spun around the rod axis.
 *
 * This is then placed on the base board, which has guides on the sides,
 * preventing the shell mount from moving anywhere but along the rod. By
 * attaching a router to the bottom of the base board, with the router bit
 * sticking out far enough to trim the shell down to the desired outer
 * diameter, the shell can now be made round by spinning it from one side
 * of the rod/base board to the other and back (as often as desired).
 */

module base()
{
  // Base board with a center hole for the router

  difference() {
    color([0, 0, 0])
    cube([1000, 400, 20]);

    translate([500, 200, 10])
    cylinder(35, 25, 25, true);
  }

  // Table legs at the bottom of the board

  translate([0, 0, -400])
  color([1.0, 1.0, 1.0])
  cube([200, 40, 400]);

  translate([0, 360, -400])
  color([1.0, 1.0, 1.0])
  cube([200, 40, 400]);

  translate([40, 40, -400])
  rotate(90)
  color([1.0, 1.0, 1.0])
  cube([320, 40, 400]);

  translate([800, 0, -400])
  color([1.0, 1.0, 1.0])
  cube([200, 40, 400]);

  translate([800, 360, -400])
  color([1.0, 1.0, 1.0])
  cube([200, 40, 400]);

  translate([1000, 40, -400])
  rotate(90)
  color([1.0, 1.0, 1.0])
  cube([320, 40, 400]);

  // Guides for shell mount

  translate([10, 10, 20])
  color([1, 1, 1])
  cube([980, 25, 25]);

  translate([10, 365, 20])
  color([1, 1, 1])
  cube([980, 25, 25]);
}

module rod_mount()
{
  // Outer mounts for the threaded rod

  difference() {
    translate([10, 35, 20])
    color([0.8, 0.6, 0.5])
    cube([40, 330, 300]);

    translate([0, 200, 230])
    rotate([0, 90, 0])
    cylinder(60, 10, 10);
  }

  difference() {
    translate([940, 35, 20])
    color([0.8, 0.6, 0.5])
    cube([40, 330, 300]);

    translate([930, 200, 230])
    rotate([0, 90, 0])
    cylinder(60, 10, 10);
  }
}

module rod()
{
  translate([-25, 200, 230])
  rotate([0, 90, 0])
  color([0.5, 0.5, 0.5])
  cylinder(1050, 10, 10);
}

module shell()
{
  // Example drum shell (14"x6.5")

  d = 14 * 2.54 * 10;
  h = 6.5 * 2.54 * 10 + 10;

  translate([500, 200, 230])
  rotate([0, 90, 0])
  difference() {
    cylinder(h, d / 2, d / 2, true);
    cylinder(h + 20, d / 2 - 12, d / 2 - 12, true);
  }
}

module shell_mount()
{
  // Runners for the shell

  difference() {
    translate([367.45, 35, 40])
    color([0.8, 0.6, 0.5])
    cube([25, 330, 300]);

    translate([357.45, 200, 230])
    rotate([0, 90, 0])
    cylinder(45, 10, 10);
  }

  difference() {
    translate([607.55, 35, 40])
    color([0.8, 0.6, 0.5])
    cube([25, 330, 300]);

    translate([597.55, 200, 230])
    rotate([0, 90, 0])
    cylinder(45, 10, 10);
  }

  // Plate to hold the runners at the right and same distance

  translate([500-400/2, 35, 20])
  difference() {
    color([0.8, 0.6, 0.5])
    cube([400, 330, 25]);

    translate([-10, 330/2 - 50/2, -10])
    cube([420, 50, 45]);
  };

  d = 14 * 2.54 * 10;

  // Round plates to mount the drum shell
  // Example drum shell (14"x6.5")
  translate([402.45, 200, 230])
  rotate([0, 90, 0])
  color([1, 1, 1])
  cylinder(20, d / 2, d / 2, true);

  translate([597.55, 200, 230])
  rotate([0, 90, 0])
  color([1, 1, 1])
  cylinder(20, d / 2, d / 2, true);
}

union() {
  base();
  rod_mount();
}

translate([0, 0, 200])
union() {
  shell_mount();
  rod();
  shell();
}
