/* window.vala
 *
 * Copyright 2019 Sebastian Giese
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

namespace Vocabtrainer {
	[GtkTemplate (ui = "/org/gnome/Vocabtrainer/window.ui")]
	public class Window : Gtk.ApplicationWindow {
		[GtkChild]
		Gtk.Label lbl_vocab;
		[GtkChild]
		Gtk.Entry entry_translation;
		[GtkChild]
        Gtk.Button btn_check;

		public Window (Gtk.Application app) {
			Object (application: app);

            FileHandler fh = new FileHandler();
            int counter = 0;

            try {
                Vocabulary.lst_vocabs = fh.read_file();

            } catch (Error e) {
                lbl_vocab.label = e.message;
            }

            if(lbl_vocab.label == "")
			    lbl_vocab.label = Vocabulary.lst_vocabs.nth_data(counter).Origin;

			btn_check.clicked.connect(() => {
			     if(Vocabulary.lst_vocabs.nth_data(counter).check(entry_translation.text) == true) {
			         counter++;
			        lbl_vocab.label = Vocabulary.lst_vocabs.nth_data(counter).Origin;
			        entry_translation.text = "";
			    }
			});
		}

	}
}
