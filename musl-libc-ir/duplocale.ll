; ModuleID = 'src/locale/duplocale.c'
source_filename = "src/locale/duplocale.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

@duplocale = weak alias %struct.__locale_struct* (%struct.__locale_struct*), %struct.__locale_struct* (%struct.__locale_struct*)* @__duplocale

; Function Attrs: nounwind optsize strictfp
define %struct.__locale_struct* @__duplocale(%struct.__locale_struct* noundef readonly %0) #0 {
  %2 = tail call i8* @__libc_malloc(i64 noundef 48) #3
  %3 = icmp eq i8* %2, null
  br i1 %3, label %9, label %4

4:                                                ; preds = %1
  %5 = bitcast i8* %2 to %struct.__locale_struct*
  %6 = icmp eq %struct.__locale_struct* %0, inttoptr (i64 -1 to %struct.__locale_struct*)
  %7 = select i1 %6, %struct.__locale_struct* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 11), %struct.__locale_struct* %0
  %8 = bitcast %struct.__locale_struct* %7 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) %2, i8* noundef nonnull align 8 dereferenceable(48) %8, i64 48, i1 false) #4, !tbaa.struct !3
  br label %9

9:                                                ; preds = %1, %4
  %10 = phi %struct.__locale_struct* [ %5, %4 ], [ null, %1 ]
  ret %struct.__locale_struct* %10
}

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 48, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
