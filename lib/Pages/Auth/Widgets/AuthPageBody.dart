import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginForm.dart';
import 'SignUpForm.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.7,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(height: 5),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: isLogin.value ? 100 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.7,
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.labelLarge
                                    : Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 5),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: isLogin.value ? 0 : 100,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => isLogin.value ? LoginForm() : SignUpForm()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
