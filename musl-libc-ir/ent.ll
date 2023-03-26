; ModuleID = 'src/network/ent.c'
source_filename = "src/network/ent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct.netent = type { i8*, i8**, i32, i32 }

@setnetent = weak alias void (i32), void (i32)* @sethostent
@endnetent = weak alias void (), void ()* @endhostent

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @sethostent(i32 %0) #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.hostent* @gethostent() local_unnamed_addr #0 {
  ret %struct.hostent* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.netent* @getnetent() local_unnamed_addr #0 {
  ret %struct.netent* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @endhostent() #0 {
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
