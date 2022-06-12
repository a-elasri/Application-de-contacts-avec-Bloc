import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contact_bloc.dart';
import '../../bloc/contacts/contact_event.dart';

class ButtonReload extends StatelessWidget {

  const ButtonReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      ContactBloc contactBloc=context.read<ContactBloc>();
      if(contactBloc.lastEvent=="All"){
        context.read<ContactBloc>().add(LoadAllContactsEvent());
      }else if(contactBloc.lastEvent=="BDDC"){
        context.read<ContactBloc>().add(LoadBDDCContactsEvent());
      }else if(contactBloc.lastEvent=="GLSID"){
        context.read<ContactBloc>().add(LoadGLSIDConctactsEvent());
      }

    }, child: Text("Reload"));
  }
}
