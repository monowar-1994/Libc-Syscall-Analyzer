; ModuleID = 'src/legacy/utmpx.c'
source_filename = "src/legacy/utmpx.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.utmpx = type { i16, i16, i32, [32 x i8], [4 x i8], [32 x i8], [256 x i8], %struct.anon, i32, i32, %struct.timeval, [4 x i32], [20 x i8] }
%struct.anon = type { i16, i16 }
%struct.timeval = type { i64, i64 }

@endutent = weak alias void (), void ()* @endutxent
@setutent = weak alias void (), void ()* @setutxent
@getutent = weak alias %struct.utmpx* (), %struct.utmpx* ()* @getutxent
@getutid = weak alias %struct.utmpx* (%struct.utmpx*), %struct.utmpx* (%struct.utmpx*)* @getutxid
@getutline = weak alias %struct.utmpx* (%struct.utmpx*), %struct.utmpx* (%struct.utmpx*)* @getutxline
@pututline = weak alias %struct.utmpx* (%struct.utmpx*), %struct.utmpx* (%struct.utmpx*)* @pututxline
@updwtmp = weak alias void (i8*, %struct.utmpx*), void (i8*, %struct.utmpx*)* @updwtmpx
@utmpname = weak alias i32 (i8*), i32 (i8*)* @__utmpxname
@utmpxname = weak alias i32 (i8*), i32 (i8*)* @__utmpxname

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @endutxent() #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @setutxent() #0 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.utmpx* @getutxent() #0 {
  ret %struct.utmpx* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.utmpx* @getutxid(%struct.utmpx* nocapture readnone %0) #0 {
  ret %struct.utmpx* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.utmpx* @getutxline(%struct.utmpx* nocapture readnone %0) #0 {
  ret %struct.utmpx* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define noalias %struct.utmpx* @pututxline(%struct.utmpx* nocapture readnone %0) #0 {
  ret %struct.utmpx* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define void @updwtmpx(i8* nocapture %0, %struct.utmpx* nocapture %1) #0 {
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn writeonly
define internal i32 @__utmpxname(i8* nocapture noundef readnone %0) #1 {
  %2 = tail call i32* @___errno_location() #3
  store i32 95, i32* %2, align 4, !tbaa !3
  ret i32 -1
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
