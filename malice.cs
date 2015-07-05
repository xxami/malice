
using System;

namespace Malice {

	class Program {

		/**
		 * entry point / main loop
		 */
		public static void Main() {

			bool running = true;

			while (running) {

				Console.Write("malice >> ");
				var line = Console.ReadLine().Trim();
				var command_args = line.Split(' ');

				switch (command_args[0]) {

					/**
					 * general
					 */
					case "exit":
					case "close":
						Program.Exit();
						running = false;
						break;

					case "help":
						Program.ShowCommands();
						break;

					/**
					 * core commands
					 */
					case "login":
						Program.Login(command_args);
						break;

					case "anime":
						Program.ListAnime(command_args);
						break;

					case "manga":
						Program.ListManga(command_args);
						break;

					case "update":
						Program.UpdateItem(command_args);
						break;

					case "refresh":
						Program.RefreshLists();
						break;

					default:
						Console.WriteLine("unknown command :: see help!");
						break;

				}

			}

		}

		/**
		 * mal login
		 */
		public static void Login(string[] args) {

		}

		/**
		 * list anime based on filter
		 */
		public static void ListAnime(string[] args) {

		}

		/**
		 * list manga based on filter
		 */
		public static void ListManga(string[] args) {

		}

		/**
		 * update an anime or manga list entry by id
		 */
		public static void UpdateItem(string[] args) {

		}

		/**
		 * refresh all cached mal data
		 */
		public static void RefreshLists() {

		}

		/**
		 * display commands
		 */
		public static void ShowCommands() {

			/**
			 * general help
			 */
			Console.WriteLine("help :: general");
			Console.WriteLine(
				" + help \t\t\t-- display this menu\n" +
				" + exit | close \t\t-- exit the interpreter");
			
			/**
			 * list of commands
			 */
			Console.WriteLine("help :: malice commands");
			Console.WriteLine(
				" + login \t\t\t-- login/fetch lists\n" +
				" + anime [filter] \t\t-- display anime lists\n" +
				" + manga [filter] \t\t-- display manga lists\n" +
				" + update manga | anime id \t-- update list for item as listed\n" +
				" + refresh \t\t\t-- fetch lists again to update data");
		}

		/**
		 * exit safely
		 */
		public static void Exit() {
			Console.WriteLine("exit :: bye bye!");
		}

	}

}
