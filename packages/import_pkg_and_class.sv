package P;
            class A;
            int i;
            endclass : A
       endpackage : P

       package R;
       import P::A;
       A a1;
       endpackage : R

       package S;
       import P::A;
       A a1;
       endpackage : S

/* both R::a1 and S::a1 are type_compatible.
if we use `include instead of import it will not work,bcz include is just like a shortcut to cut/paste from a file.