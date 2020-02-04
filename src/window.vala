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

		int counter = Random.int_range(0, (int)Vocabulary.lst_vocabs.length());
		Gtk.CssProvider p;
		string wrong;
		string right;

		public Window (Gtk.Application app) {
			Object (application: app);
			btn_check.set_can_focus(false);

			FileHandler fh = new FileHandler();

			wrong = "* { color: #ff0000 }";
		    right = "* { color: #00cc00 }";
		    p = new Gtk.CssProvider();

            try {
                p.load_from_data(right, right.length);
                lbl_vocab.get_style_context().add_provider(p, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            } catch(Error e) {
                        lbl_vocab.label = e.message.to_string();
            } finally {
                entry_translation.text = "";
            }


            try {
                Vocabulary.lst_vocabs = fh.read_file();

            } catch (Error e) {
                lbl_vocab.label = e.message;
            }

            if(lbl_vocab.label == "")
			    lbl_vocab.label = Vocabulary.lst_vocabs.nth_data(counter).Origin;

					btn_check.clicked.connect(check_translation);

          entry_translation.key_press_event.connect((key) => {
            if(key.keyval == 65293)
                check_translation();

            //lbl_vocab.label = key.keyval.to_string();
            return false;
          });
		}

		private void check_translation() {
			//if(counter != Vocabulary.lst_vocabs.length() - 1) {
			    if(Vocabulary.lst_vocabs.nth_data(counter).check(entry_translation.text) == true) {
					counter = Random.int_range(0, (int)Vocabulary.lst_vocabs.length());
					lbl_vocab.label = Vocabulary.lst_vocabs.nth_data(counter).Origin;

					try {
						p.load_from_data(right, right.length);
						lbl_vocab.get_style_context().add_provider(p, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
					} catch(Error e) {
						lbl_vocab.label = e.message.to_string();
					} finally {
						entry_translation.text = "";
					}

				}

				else {
				    try {
				        p.load_from_data(wrong, wrong.length);
					    lbl_vocab.get_style_context().add_provider(p, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
				    } catch(Error e) {
					    lbl_vocab.label = e.message.to_string();
				    } finally {
					    entry_translation.text = "";
				    }
				}
			//}

			// else {
			// 	counter = 0;
			// 	lbl_vocab.label = Vocabulary.lst_vocabs.nth_data(counter).Origin;
			// 	entry_translation.text = "";
			// }
		}
	}
}
