

using System;
using Akka.Actor;

namespace Malice {

	class AMalLogin : UntypedActor {

		public class WithDetails {

			public string User { get; private set; }
			public string Password { get; private set; }

			public WithDetails(string user, string password) {
				this.User = user;
				this.Password = password;
			}
		}

		public class UsingPrompt {

			public UsingPrompt() { }

		}

		public AMalLogin() { }

		protected override void OnReceive(object msg) {

			if (msg is AMalLogin.WithDetails) {
				var details = (AMalLogin.WithDetails) msg;
			}
			else {
				/**
				 * prompt for user/passwd before logging in
				 */
			}

		}

	}

}